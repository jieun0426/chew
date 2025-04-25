package com.mbc.chew.likes;

public class LikesDTO {

    private String memberId;
    private int storecode;

    public LikesDTO(String memberId, int storecode) {
        this.memberId = memberId;
        this.storecode = storecode;
    }

    public String getMemberId() {
        return memberId;
    }

    public void setMemberId(String memberId) {
        this.memberId = memberId;
    }

    public int getStorecode() {
        return storecode;
    }

    public void setStorecode(int storecode) {
        this.storecode = storecode;
    }
}
