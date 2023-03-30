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

public class UpdateMovie implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getServletContext().getRealPath("movieImg");
		int maxSize = 1024 * 1024*10;
		String movieImage = null;
		int result = 0;
		try {
			// 첨부한 파일을 서버에 저장하고, 파일이름 가져오기
			MultipartRequest mRequest = new MultipartRequest(request,path,maxSize,"utf-8",new DefaultFileRenamePolicy());
			
			request.setAttribute("q", mRequest.getParameter("q"));

			movieImage = mRequest.getFilesystemName("movieImage");
			String oldImage = mRequest.getParameter("oldImage");
			movieImage = (movieImage == null ? oldImage : movieImage);
			
			String movieId = mRequest.getParameter("movieId");
			String movieTitle = mRequest.getParameter("movieTitle");
			String originalTitle = mRequest.getParameter("originalTitle");
			String movieSummary = mRequest.getParameter("movieSummary");
			int movieRunning = 0;
			String movieRunningStr = mRequest.getParameter("movieRunning");
			if(!movieRunningStr.equals("")) {
				movieRunning = Integer.parseInt(movieRunningStr);
			}
			Date movieDate = null;
			String movieDateStr = mRequest.getParameter("movieDate");
			if(!movieDateStr.equals("")) {
				movieDate = Date.valueOf(movieDateStr);
			}
			String movieGrade = mRequest.getParameter("movieGrade");
			int movieAudience = 0;
			String movieAudienceStr = mRequest.getParameter("movieAudience");
			if(!movieAudienceStr.equals("")) {
				movieAudience = Integer.parseInt(movieAudienceStr);
			}
			String stateStr = mRequest.getParameter("state");
			int state = Integer.parseInt(stateStr);
			
			MovieDao movie = new MovieDao();
			result = movie.updateMovie(new MovieDto(movieId, originalTitle, movieTitle, movieSummary, movieRunning, movieImage, movieDate, movieGrade, movieAudience, state));
			if(result==0) {
				request.setAttribute("updateMovieResult", "영화 수정 실패");				
			}else {
				request.setAttribute("updateMovieResult", "영화 수정 성공");
			}
			
		} catch (IOException e) {
			System.out.println(e.getMessage());
			request.setAttribute("updateMovieError", "영화 수정 에러 - 첨부파일의 용량이 너무 큰지 확인 요망");
		}
		
		// 이클립스에도 서버첨부파일 복사
		File serverFile = new File(path+"/"+movieImage);
		if(movieImage!=null && !(movieImage.equals("NOIMG.JPG")) && result==1){
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
