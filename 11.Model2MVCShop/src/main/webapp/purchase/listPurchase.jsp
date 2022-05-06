<%@ page contentType="text/html; charset=EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>���� �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
function fncGetList(currentPage) {
	document.getElementById("currentPage").value = currentPage;
   /* 	document.detailForm.submit();	action="/purchase/listPurchase"	 */
	$("form").attr("method" , "POST").attr("action" , "/purchase/listPurchase").submit();
}
/* <a href="/purchase/getPurchase?tranNo=${purchase.tranNo}"> */
/*  <a href="/user/getUser?userId=${purchase.buyerId.userId}">  */
$(function(){
	$( ".ct_list_pop td:nth-child(1)").on("click" , function() {
		/* var tranNo = $(this).next().val(); */
		self.location ="/purchase/getPurchase?tranNo="+$(this).attr("tranNo");

		$( "td:nth-child(2)" ).css("color" , "red");
	});
});
$(function(){
	$( ".ct_list_pop td:nth-child(2)").on("click" , function() {
		/* var userId = $(this).next().val(); */
		self.location ="/user/getUser?userId="+$(this).text().trim();
	});
	$( ".ct_list_pop td:nth-child(2)" ).css("color" , "red");
	$("h7").css("color" , "red");

});
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

<form name="detailForm" >

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">���� �����ȸ</td>
					
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td colspan="11">��ü${resultPage.totalCount }�Ǽ�, ���� ${resultPage.currentPage}������</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ��ID</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��ȭ��ȣ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����Ȳ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��������</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
		
	<c:set var="i" value="0"/>
	<c:forEach var="purchase" items="${list}">
		<c:set var="i" value="${i+1}"/>
		<tr class="ct_list_pop">
		<td align="center" tranNo="${purchase.tranNo}"title="Click : ��ǰ�������� Ȯ��"><%-- <a href="/purchase/getPurchase?tranNo=${purchase.tranNo}"> --%>${ i }</td>
		<td></td>
		<%-- <td align="left" userId="${purchase.buyerId.userId}"><a href="/user/getUser?userId=${purchase.buyerId.userId}">${purchase.buyerId.userId}<!-- </a> --></td> --%>
		<td align="left" userId="${user.userId}"title="Click : �������� Ȯ��">${user.userId}</td>
		<td></td>
		<td align="left">${purchase.receiverName}</td>
		<td></td>
		<td align="left">${purchase.receiverPhone}</td>
		<td></td>
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
		<tr>
	</tr>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>
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

<!--  ������ Navigator �� -->
</form>

</div>

</body>
</html>