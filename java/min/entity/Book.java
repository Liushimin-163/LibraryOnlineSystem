package min.entity;

import java.util.Date;

public class Book {
    private Integer id;

    private String title;

    private String isbn;

    private String author;

    private String introduction;

    private String price;

    private String publishTime;

    private Integer categoryId;

    private String image;

    private Date createTime;

    private String createAdmin;

    private String updatePreAdmin;

    private Integer delFlg;
    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(String publishTime) {
        this.publishTime = publishTime;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getCreateAdmin() {
        return createAdmin;
    }

    public void setCreateAdmin(String createAdmin) {
        this.createAdmin = createAdmin;
    }

    public String getUpdatePreAdmin() {
        return updatePreAdmin;
    }

    public void setUpdatePreAdmin(String updatePreAdmin) {
        this.updatePreAdmin = updatePreAdmin;
    }

    public Integer getDelFlg() {
        return delFlg;
    }

    public void setDelFlg(Integer delFlg) {
        this.delFlg = delFlg;
    }



    @Override
    public String toString() {
        return "Book{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", isbn='" + isbn + '\'' +
                ", author='" + author + '\'' +
                ", introduction='" + introduction + '\'' +
                ", price='" + price + '\'' +
                ", publishTime='" + publishTime + '\'' +
                ", categoryId=" + categoryId +
                ", image='" + image + '\'' +
                ", createTime=" + createTime +
                ", createAdmin='" + createAdmin + '\'' +
                ", updatePreAdmin='" + updatePreAdmin + '\'' +
                ", delFlg=" + delFlg +
                '}';
    }
}
