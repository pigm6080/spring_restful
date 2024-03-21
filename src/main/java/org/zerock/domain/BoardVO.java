package org.zerock.domain;

import java.util.Date;

import lombok.ToString;

import lombok.Getter;

import lombok.Setter;

@Setter
@Getter
@ToString
public class BoardVO {
	
	private long bno;
	private String title;
	private String content;
	private String writer;
	private Date regDate;
	private Date updatedate;
	
}
