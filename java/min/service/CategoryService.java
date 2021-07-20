package min.service;

import min.entity.Category;

import java.util.List;

public interface CategoryService {
    List<Category> selectCategoryList();
    Category selectByPrimaryKey(Integer id);
}
