package min.service.impl;

import min.entity.Book;
import min.entity.PageBean;
import min.mapper.BookMapper;
import min.service.BookService;
import min.util.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service("bookService")
public class BookServiceImpl implements BookService {

    @Autowired
    private BookMapper bookMapper;

    @Override
    public void insertBook(Book book) {
     bookMapper.insert(book);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return bookMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Book selectByID(int id) {
        return bookMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(Book book) {
        return bookMapper.updateByPrimaryKeySelective(book);
    }

    @Override
    public PageBean<Book> selectByPage(String title, String author, int currentPage) {
        HashMap<String,Object> map = new HashMap<String,Object>();
        PageBean<Book> pageBean = new PageBean<Book>();

        //设置当前页数
        pageBean.setCurrPage(currentPage);

        //设置每页显示的数据
        int pageSize = Message.PAGE_SIZE;
        pageBean.setPageSize(pageSize);

        //设置总页数
        int totalCount =bookMapper.selectCount();
        pageBean.setTotalCount(totalCount);

        //设置总页数
        double tc = totalCount;
        Double num = Math.ceil(tc/pageSize);
        pageBean.setTotalPage(num.intValue());

        map.put("start", (currentPage-1)*pageSize);
        map.put("size", pageBean.getPageSize());
        map.put("author", author);
        map.put("title", title);

        //封装每页显示的数据
        List<Book> bookList = bookMapper.selectByPage(map);
        pageBean.setLists(bookList);

        return pageBean;
    }

    @Override
    public List<Book> selectNewBook() {
        return bookMapper.selectNewBook();
    }

    @Override
    public List<Book> selectBookDel() {
        return bookMapper.selectBookDel();
    }

    @Override
    public int updateBackBook(int id) {
        return bookMapper.updateBackBook(id);
    }

    @Override
    public int deleteBookReal(int id) {
        return bookMapper.deleteBookReal(id);
    }
}
