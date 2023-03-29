package com.ch.movie.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ch.movie.dao.MovieDao;
import com.ch.movie.dto.MovieDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class RegisterMovie implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		
		
		String path = request.getServletContext().getRealPath("movieImg");
		int maxSize = 1024 * 1024*10;
		String movieImage = null;
		int result = 0;
		try {
			// 첨부한 파일을 서버에 저장하고, 파일이름 가져오기
			MultipartRequest mRequest = new MultipartRequest(request,path,maxSize,"utf-8",new DefaultFileRenamePolicy());
			movieImage = mRequest.getFilesystemName("movieImage");
			movieImage = (movieImage == null ? "NOIMG.JPG" : movieImage);
			String movieTitle = mRequest.getParameter("movieTitle");
			String originalTitle = mRequest.getParameter("originalTitle");
			String movieSummary = mRequest.getParameter("movieSummary");
			String movieRunningStr = mRequest.getParameter("movieRunning");
			int movieRunning = Integer.parseInt(movieRunningStr);
			String movieDateStr = mRequest.getParameter("movieDate");
			Date movieDate = Date.valueOf(movieDateStr);
			String movieGrade = mRequest.getParameter("movieGrade");
			String movieAudienceStr = mRequest.getParameter("movieAudience");
			int movieAudience = Integer.parseInt(movieAudienceStr);
			String stateStr = mRequest.getParameter("state");
			int state = Integer.parseInt(stateStr);
			
			MovieDao movie = new MovieDao();
			result = movie.registerMovie(new MovieDto(null, originalTitle, movieTitle, movieSummary, movieRunning, movieImage, movieDate, movieGrade, movieAudience, state));
			
			if(result==1) {
				request.setAttribute("registerResult", "영화등록 성공");				
			}else {
				request.setAttribute("registerResult", "영화등록 실패");				
			}
			
		} catch (IOException e) {
			System.out.println(e.getMessage());
			request.setAttribute("registerMovieError", "영화 등록 에러 - 첨부파일의 용량이 너무 큰지 확인 요망");
		}
		
		// 이클립스에도 서버첨부파일 복사
		File serverFile = new File(path+"/"+movieImage);
		if(movieImage!=null && result==1){
			InputStream is = null;
			OutputStream os = null;
			try{
				is = new FileInputStream(serverFile);
				os = new FileOutputStream("D:/webPro/source/08_individual_project/CheeYoonMovie/WebContent/movieImg/"+movieImage);
				byte[] bs = new byte[(int)serverFile.length()];
				int readByteCnt;
				while((readByteCnt = is.read(bs)) != -1){
					os.write(bs,0,readByteCnt);
				}
				System.out.println(movieImage+"복사함");
			}catch(IOException e){
				System.out.println(e.getMessage());
			}finally{
				try {
					if(os!=null) os.close();
					if(is!=null) is.close();
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			}
		}// 파일복사 if
		
		

	}

}
