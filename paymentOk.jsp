<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>paymentOk.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	
	<script>
	// https://www.iamport.kr/
		IMP.init('imp85272380'); // 가맹점 식별코드 
		// 장바구니 vo에서 데이터를 빼오는 방법
		IMP.request_pay({
		    pg : 'kakaopay', // 카카오 테스트
/* 		    pg : 'inicis', // version 1.1.0부터 지원.		// 변경된 방침에서는 pg : 'html5_inicis' 로 고쳐준다. */
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '상품1' , //결제창에서 보여질 이름
		    amount : 100, //실제 결제되는 가격
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '구매자이름',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울 강남구 도곡동',
		    buyer_postcode : '123-456'
		}, function(rsp) {
			  var paySw = 'no';
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		        paySw = 'ok';
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		    if(paySw == 'no') {
			    alert("다시 주문구매창으로 이동합니다.");
		    	location.href='/';
		    }
		    else {
					var temp = "";
			    
// 					temp += '?name=${payMentVo.name}';
// 					temp += '&amount=${payMentVo.amount}';
// 					temp += '&buyer_email=${payMentVo.buyer_email}';
// 					temp += '&b yer_name=${payMentVo.buyer_name}';
// 					temp += '&buyer_tel=${payMentVo.buyer_tel}';
// 					temp += '&buyer_addr=${payMentVo.buyer_addr}';
// 					temp += '&buyer_postcode=${payMentVo.buyer_postcode}';
// 					temp += '&imp_uid=' + rsp.imp_uid;
// 					temp += '&merchant_uid=' + rsp.merchant_uid;
// 					temp += '&paid_amount=' + rsp.paid_amount;
// 					temp += '&apply_num=' + rsp.apply_num;
			    
			    		temp += '?name=${name}';
					temp += '&amount=${amount}';
					temp += '&buyer_email=${buyer_email}';
					temp += '&b yer_name=${buyer_name}';
					temp += '&buyer_tel=${buyer_tel}';
					temp += '&buyer_addr=${buyer_addr}';
					temp += '&buyer_postcode=${buyer_postcode}';
					temp += '&imp_uid=' + rsp.imp_uid;
					temp += '&merchant_uid=' + rsp.merchant_uid;
					temp += '&paid_amount=' + rsp.paid_amount;
					temp += '&apply_num=' + rsp.apply_num;
					
					//temp += '&orderIdx=${orderVo.orderIdx}';
					
					location.href='${ctp}/dbShop/paymentResult'+temp;
		    }
		});
	</script>
</head>
<body>
<div class="container">
  <h2>결제처리 연습</h2>
  <h3>현재 결제가 진행중입니다.</h3>
</div>
</body>
</html>
