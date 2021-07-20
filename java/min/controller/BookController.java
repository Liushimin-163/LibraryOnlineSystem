package min.controller;

import min.entity.Book;
import min.entity.Category;
import min.entity.User;
import min.service.BookService;
import min.service.CategoryService;
import min.util.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.UUID;

import static min.util.Message.IMG_LOCAL_PATH;

@Controller
public class BookController {

    @Autowired
    private BookService bookService;
    @Autowired
    private CategoryService categoryService;

    @RequestMapping(value="/showBook")//有点不记得了，复习
    public String showAllBOOKPage(@RequestParam(value="currentPage",defaultValue = "1",required=false)int currentPage, String title, String author, Model model){
        model.addAttribute("pageMsg",bookService.selectByPage(title,author,currentPage));
        return "showAllBook";
    }
    @RequestMapping(value="/searchBook")
    public String toSearchBook(){return "searchBook";}
    @RequestMapping(value="/searchBookPage")
    public String searchBook(@RequestParam(value = "currentPage", defaultValue = "1", required = false)
                                     int currentPage, String title, String author, Model model) {
        model.addAttribute("pageMsg", bookService.selectByPage(title, author, currentPage));
        return "searchBook";
    }
    @RequestMapping(value = "/bookDetail")
    public String showBookDetail(int id, Model model) {
        Book book = bookService.selectByID(id);
        Category cate = categoryService.selectByPrimaryKey(book.getCategoryId());
        model.addAttribute("book", book);
        model.addAttribute("cate", cate);
        return "bookDetail";
    }
    @RequestMapping(value = "/toAddNewBook")
    public String toAddNewBook() {
        return "addNewBook";
    }
    @RequestMapping(value = "/addNewBook")
    public String addNewBook(Book book, MultipartFile file, HttpServletRequest request, HttpSession httpSession) {
        User admin = (User) httpSession.getAttribute("user");
        System.out.println("submit list：" + book);
        //SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        book.setCreateTime(new Date());
        book.setCreateAdmin(admin.getAdminName());
        book.setUpdatePreAdmin(admin.getAdminName());
        book.setDelFlg(1);


        //String filePath = request.getSession().getServletContext().getRealPath("/bookImage");; //定义图片上传后的路径
        //System.out.println("文件上传路径:"+filePath);
        String newFileName = fileOperate(file, IMG_LOCAL_PATH);
        book.setImage(newFileName);
        System.out.println("after updated book :" + book);
        bookService.insertBook(book);
        return "redirect:newBookList";
    }


    /**
     * 查询最近上架的图书
     */
    @RequestMapping(value = "/newBookList")
    public String newBookList(Model model) {
        model.addAttribute("newBookList", bookService.selectNewBook());
        return "newBookList";
    }

    /**
     * 下架图书
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/deleteBook")
    public String deleteBook(int id) {
        bookService.deleteByPrimaryKey(id);
        return "redirect:showBook";
    }

    /**
     * 下架新上架的图书
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/deleteBookNewList")
    public String deleteBookNewList(int id) {
        bookService.deleteByPrimaryKey(id);
        return "redirect:newBookList";
    }

    /**
     * 下架查询到的图书
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/deleteSearchBook")
    public String deleteSearchBook(int id) {
        bookService.deleteByPrimaryKey(id);
        return "redirect:searchBook";
    }


    /**
     * 已下架图书列表
     */
    @RequestMapping(value = "/deleteBookList")
    public String deleteBookList(Model model) {
        model.addAttribute("bookList", bookService.selectBookDel());
        return "delBookList";
    }


    /**
     * 跳转到修改图书信息
     */
    @RequestMapping(value = "/toUpdateBook")
    public String updateBookPage(int id, Model model) {
        Book book = bookService.selectByID(id);
        Category cate = categoryService.selectByPrimaryKey(book.getCategoryId());
        model.addAttribute("book", book);
        model.addAttribute("cate", cate);
        return "editBook";
    }

    /**
     * 修改图书信息
     *
     * @param book
     * @param file
     * @param httpSession
     * @return
     */
    @RequestMapping(value = "/updateBook")
    public String updateBook(Book book, MultipartFile file, HttpSession httpSession) {
        System.out.println("updating book:" + book);
        Book oldBook = bookService.selectByID(book.getId());
        book.setPublishTime(oldBook.getPublishTime());
        User admin = (User) httpSession.getAttribute("user");
        book.setUpdatePreAdmin(admin.getAdminName());
//        String newFileName = fileOperate(file, Message.IMG_LOCAL_PATH);
        String newFileName = fileOperate(file, httpSession.getServletContext().getRealPath(IMG_LOCAL_PATH));
        System.out.println(newFileName);
        book.setImage(newFileName);
        System.out.println("updated:" + book);
        bookService.updateByPrimaryKeySelective(book);
        return "redirect:showBook";

    }

    /**
     * 重新上架图书
     */
    @RequestMapping("/updateBackBook")
    public String updateBackBook(int id) {
        bookService.updateBackBook(id);
        return "redirect:showBook";
    }

    /**
     * 彻底删除图书
     */
    @RequestMapping("/deleteBookReal")
    public String deleteBookReal(int id) {
        bookService.deleteBookReal(id);
        return "redirect:deleteBookList";
    }


    /**
     * 封装操作文件方法，
     *
     * @param file
     * @param filePath
     * @return
     */
    private String fileOperate(MultipartFile file, String filePath) {
        System.out.println("Starting running");
        String originalFileName = file.getOriginalFilename();//获取原始图片的名
        //获取文件后缀
        /*String suffix = originalFileName.substring(originalFileName.lastIndexOf("."));
        System.out.println("original filename：" + originalFileName);*/
        String newFileName = UUID.randomUUID() + ".jpg";  //新的图书名称
        System.out.println("new file name：" + newFileName);
        File targetFile = new File(filePath, newFileName); //创建新图书
        try {
            File dir = new File(targetFile.getParent());
            if (!dir.exists()) {
                dir.mkdirs();
            }
            file.transferTo(targetFile); //把本地文件上传到文件位置 , transferTo()是springmvc封装的方法，用于图片上传时，把内存中图片写入磁盘
            System.out.println("Update successful！");
        } catch (IllegalStateException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return newFileName;
    }


}
