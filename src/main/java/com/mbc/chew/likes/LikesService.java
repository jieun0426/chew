package com.mbc.chew.likes;



public interface LikesService {

	int isLiked(LikesDTO ldto);

	int deleteLike(LikesDTO ldto);

	int insertLike(LikesDTO ldto);

	void decreaseLikes(Integer storecode);

	void increaseLikes(Integer storecode);

	int getLikesCountFromStore3(Integer storecode);

	

}
