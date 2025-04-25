package com.mbc.chew.likes;



public interface LikesService {

	int isLiked(LikesDTO ldto);

	int deleteLike(LikesDTO ldto);

	int insertLike(LikesDTO ldto);

	

}
