<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>

</head>
<body>
                                    <div class="card-body"><%-- <canvas id="myBarChart" width="100%" height="40"></canvas> --%></div>
                                </div>
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                가입한 회원 정보
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>글 번호</th>
                                            <th>분류</th>
                                            <th>제목</th>
                                            <th>작성자</th>
                                            <th>등록일</th>
                                   
                                        </tr>
                                    </thead>
                                    <tbody>
                                        
                                      <c:forEach var="CustomerCenterDTO" items="${list}">
									<tr>
										<td><c:out value="${CustomerCenterDTO.cus_b_num}" /></td>
										<td><c:out value="${CustomerCenterDTO.category }"/></td>
										<td><a href="faqlistAdmin?cus_b_num=${CustomerCenterDTO.cus_b_num }"><c:out value="${CustomerCenterDTO.subject }" /></a></td>
										<td>${CustomerCenterDTO.userid}</td>
										<td>${CustomerCenterDTO.writedate}</td>
									</tr>
								</c:forEach>
                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
</body>             
                
        
      <!--   </div>  -->
</body>