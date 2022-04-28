package com.tisproject.biz.user.DTO;

import java.sql.Date;
import java.util.Arrays;


public class UserVO {
	private int id;
	private String userid;
	private String password;
	private String email;
	private String nickname;
	
	private Date birthday;
	
	private char gender;
	private int[] favorite_genre;
	private int rank;
	private int icon;
	private int favorite_genre1;
	private int favorite_genre2;
	private int favorite_genre3;
	
	private int manager;

	public int getManager() {
		return manager;
	}
	public void setManager(int manager) {
		this.manager = manager;
	}


	//테이블에 없는 값
	private int click;
	

	public int getClick() {
		return click;
	}
	public void setClick(int click) {
		this.click = click;
	}


	// 보관함
	private int titleNo;
	private String title;
	private String synopsis;
	private String actor;
	private String director;
	private Date releaseDate;
	private Date updateDate;
	private int age;
	private char series;
	private String poster;
	private String backImg;
	
	
	
	
	
	public int getFavorite_genre1() {
		return favorite_genre1;
	}
	public void setFavorite_genre1(int favorite_genre1) {
		this.favorite_genre1 = favorite_genre1;
	}
	public int getFavorite_genre2() {
		return favorite_genre2;
	}
	public void setFavorite_genre2(int favorite_genre2) {
		this.favorite_genre2 = favorite_genre2;
	}
	public int getFavorite_genre3() {
		return favorite_genre3;
	}
	public void setFavorite_genre3(int favorite_genre3) {
		this.favorite_genre3 = favorite_genre3;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public int getTitleNo() {
		return titleNo;
	}
	public void setTitleNo(int titleNo) {
		this.titleNo = titleNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSynopsis() {
		return synopsis;
	}
	public void setSynopsis(String synopsis) {
		this.synopsis = synopsis;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public Date getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public char getSeries() {
		return series;
	}
	public void setSeries(char series) {
		this.series = series;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getBackImg() {
		return backImg;
	}
	public void setBackImg(String backImg) {
		this.backImg = backImg;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date date) {
		this.birthday = date;
	}
	public char getGender() {
		return gender;
	}
	public void setGender(char c) {
		this.gender = c;
	}


	public int[] getFavorite_genre() {
		return favorite_genre;
	}
	public void setFavorite_genre(int[] favorite_Genre) {
		this.favorite_genre = favorite_Genre;
	}
	public int getIcon() {
		return icon;
	}
	public void setIcon(int icon) {
		this.icon = icon;
	}
	@Override
	public String toString() {
		return "UserVO [id=" + id + ", userid=" + userid + ", password=" + password + ", email=" + email + ", nickname="
				+ nickname + ", birthday=" + birthday + ", gender=" + gender + ", favorite_genre="
				+ Arrays.toString(favorite_genre) + ", rank=" + rank + ", icon=" + icon + ", favorite_genre1="
				+ favorite_genre1 + ", favorite_genre2=" + favorite_genre2 + ", favorite_genre3=" + favorite_genre3
				+ ", manager=" + manager + ", click=" + click + ", titleNo=" + titleNo + ", title=" + title
				+ ", synopsis=" + synopsis + ", actor=" + actor + ", director=" + director + ", releaseDate="
				+ releaseDate + ", updateDate=" + updateDate + ", age=" + age + ", series=" + series + ", poster="
				+ poster + ", backImg=" + backImg + "]";
	}
	
	
	

	
	
	

	
	
	
	
}