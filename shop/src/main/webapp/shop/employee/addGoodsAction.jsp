<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ page import = "com.oreilly.servlet.multipart.*" %>   
<%@ page import = "service.GoodsService" %> 
<%@ page import = "vo.Goods" %> 
<%@ page import = "vo.*" %> 
<%@ page import = "java.io.File" %>

<%

	String dir = request.getServletContext().getRealPath("/upload");
	System.out.println(dir);
	
	int max = 10 * 1024 * 1024; 
	MultipartRequest mRequest = new MultipartRequest(request, dir, max, "UTF-8", new DefaultFileRenamePolicy());
	
	String goodsName = mRequest.getParameter("goods_name");
	int goodsPrice = Integer.parseInt(mRequest.getParameter("goods_price"));
	String goodsContent = mRequest.getParameter("goods_content");
	
	String soldOut = mRequest.getParameter("sold_out");
	String fileName = mRequest.getFilesystemName("imgFile"); // dir파일이름
	String contentType = mRequest.getContentType("imgFile");//파일타입확인
	String OriginalFileName = mRequest.getOriginalFileName("imgFile"); //원본파일이름
	
	// 디버깅
	System.out.println(goodsName + "goods_name"); 
	System.out.println(goodsPrice + "goods_price");
	System.out.println(goodsContent + "goods_content");
	System.out.println(soldOut +"sold_out" );
	System.out.println(fileName );
	System.out.println(soldOut);
	
	 if(!(contentType.equals("image/gif") || contentType.equals("image/png") || contentType.equals("image/jpg")|| contentType.equals("image/jpeg"))) {
	      // 이미 업로드된 파일을 삭제
	      File f = new File(dir+"\\"+fileName);
	      if(f.exists()) {
	         f.delete();
	      }
	      String errorMsg = URLEncoder.encode("이미지파일만 업로드 가능", "UTF-8");
	      response.sendRedirect(request.getContextPath()+"/addGoodsFrom.jsp?errorMsg="+errorMsg);
	      return; // 이미지추가폼으로 이동
	   }
	
   Goods goods = new Goods();
   GoodsImg goodsImg = new GoodsImg();
   goods.setGoodsName(goodsName);
   goods.setGoodsPrice(goodsPrice);
   goods.setGoodsContent(goodsContent);
   goods.setSoldOut(soldOut);
   goodsImg.setFileName(fileName);
   goodsImg.setContentType(contentType);
   goodsImg.setOriginFileName(OriginalFileName);
   
   int row = 0;
   GoodsService goodsservice = new GoodsService();
   row = goodsservice.addGoods(goods, goodsImg);
   if(row != 0){
	      System.out.println("이미지 업로드 성공 !");
	      response.sendRedirect(request.getContextPath() + "/admin/adminGoodsList.jsp");
	   } else {
	      System.out.println("이미지 업로드 실패 !");
	      response.sendRedirect(request.getContextPath() + "/admin/addGoodsForm.jsp?errorMsg=img insert Fail");
	   
	   }
%> 