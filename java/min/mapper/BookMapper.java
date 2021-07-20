package min.mapper;

import min.entity.Book;

import java.util.List;
import java.util.Map;

public interface BookMapper {
    int deleteByPrimaryKey(Integer id);

    /**
     * 插入文件
     * @param record
     * @return
     */
    int insert(Book record);
    /**
     * 插入文件
     * @param record
     * @return
     */
    int insertSelective(Book record);

    Book selectByPrimaryKey(Integer id);

    /**
     * 通过主键更新图书
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Book book);


    int updateByPrimaryKey(Book record);


    /**
     * 分页查询
     * @param map
     * @return
     */
    List<Book> selectByPage(Map<String,Object> map);

    /**
     * 查询总数
     * @return
     */
    int selectCount();


    /**
     * 最近上架的图书(最近2个月)
     */
    List<Book>  selectNewBook();


    /**
     * 所有下架的图书
     */
    List<Book>  selectBookDel();


    /**
     * 重新上架图书
     */
    int updateBackBook(int id);


    /**
     * 彻底删除图书
     */
    int deleteBookReal(int id);



}
