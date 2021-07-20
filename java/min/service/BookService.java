package min.service;

import min.entity.Book;
import min.entity.PageBean;

import java.util.List;

public interface BookService {
    void insertBook(Book book);
    int deleteByPrimaryKey(Integer id);
    Book selectByID(int id);
    int updateByPrimaryKeySelective(Book record);
    PageBean<Book> selectByPage(String title, String author, int currentPage);
    List<Book> selectNewBook();
    List<Book>  selectBookDel();
    int updateBackBook(int id);
    int deleteBookReal(int id);
}
