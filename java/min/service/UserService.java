package min.service;

import min.entity.User;

import java.util.Map;

public interface UserService {
    User selectAdmin(Map<String,String> map);
    User selectByPrimaryKey(Integer id);
}
