<%@ page contentType="text/html; charset=EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
    <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
function fncGetList(currentPage) {
	document.getElementById("currentPage").value = currentPage;
   /* 	document.detailForm.submit();	action="/purchase/listPurchase"	 */
	$("form").attr("method" , "POST").attr("action" , "/purchase/listPurchase").submit();
}
/* <a href="/purchase/getPurchase?tranNo=${purchase.tranNo}"> */
/*  <a href="/user/getUser?userId=${purchase.buyerId.userId}">  */
$(function(){
	$( "td:nth-child(1)").on("click" , function() {
		/* var tranNo = $(this).next().val(); */
		self.location ="/purchase/getPurchase?tranNo="+$(this).attr("tranNo");

		$( "td:nth-child(2)" ).css("color" , "red");
	});
});
$(function(){
	$( "td:nth-child(2)").on("click" , function() {
		/* var userId = $(this).next().val(); */
		self.location ="/user/getUser?userId="+$(this).text().trim();
	});
	$( ".ct_list_pop td:nth-child(2)" ).css("color" , "red");
	$("h7").css("color" , "red");

});
</script>
</head>

<body >

   <jsp:include page="/layout/toolbar.jsp" />
   
   <div class="container">
   
   <div class="page-header text-info">

<form name="detailForm" >

 <div class="page-header text-info">
<c:set var="name" />
<h3>���� �����ȸ</h3>

 <div class="row">
   
       <div class="col-md-6 text-left">
             <p class="text-primary">
                ��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
             </p>
      </div>
      
<table class="table table-hover table-striped" >
         
          <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >ȸ��ID</th>
            <th align="left">ȸ����</th>
            <th align="left">��ȭ��ȣ</th>
            <th align="left">�����Ȳ</th>
            <th align="left">��������</th>
          </tr>
        </thead>
		
		<c:set var="i" value="0" />
        <c:forEach var="purchase" items="${list}">
         <c:set var="i" value="${ i+1 }" />
         <tr>
           <td align="center" tranNo="${purchase.tranNo}"title="Click : ��ǰ�������� Ȯ��">${ i }</td>

           <td align="left" userId="${user.userId}"title="Click : �������� Ȯ��">${user.userId}</td>

           <td align="left">${purchase.receiverName}</td>

			<td align="left">${purchase.receiverPhone}</td>

			<td align="left">���� 
            <c:choose>
				<c:when test="${purchase.tranCode.trim() eq '0'}">�Ǹ���</c:when>
				<c:when test="${purchase.tranCode.trim() eq '1'}">���ſϷ�</c:when>
				<c:when test="${purchase.tranCode.trim() eq '2'}">�����</c:when>
				<c:otherwise>��ۿϷ�</c:otherwise>	
				</c:choose>
				 ���� �Դϴ�.</td>
			<td></td>
			<td align="left">
				<c:if test="${purchase.tranCode.trim()  eq '2'}">
					<a href="/purchase/updateTranCode?prodNo=${purchase.purchaseProd.prodNo}&tranCode=3">���ǵ���</a>
				</c:if>
			</td>
          </c:forEach>
</table>		
		

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td align="center">
		<input type="hidden" id="currentPage" name="currentPage" value=""/>
		
			<jsp:include page="../common/pageNavigator.jsp"/>	
		</td>
	</tr>
</table>
  </form>
<!--  ������ Navigator �� -->
</form>

</div>

</body>
</html>