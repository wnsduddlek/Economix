<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : EgovBoardMstrListPop.jsp
  * @Description : 게시판 속성 조회 팝업
  * @Modification Information
  * @
  * @  수정일      수정자            수정내용
  * @ -------        --------    ---------------------------
  * @ 2009.03.12   이삼섭          최초 생성
  *
  *  @author 공통서비스 개발팀 이삼섭
  *  @since 2009.03.12
  *  @version 1.0
  *  @see
  *
  */
%>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">   	
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cop/bbs/EgovBBSMng.js' />"></script>
<script type="text/javascript">
	function press(event) {
		if (event.keyCode==13) {
			fn_egov_select_brdMstr('1');
		}
	}
	function fn_egov_select_brdMstr(pageNo){
		document.frm.pageIndex.value = pageNo;
		document.frm.action = "<c:url value='/cop/bbs/SelectBBSMasterInfsPop.do'/>";
		document.frm.submit();
	}

	function fn_egov_select_brdMstrInfo(bbsId, bbsNm){
		var retVal = bbsId +"|"+bbsNm;
		parent.fn_egov_returnValue(retVal);
	}
</script>
<title>게시판 정보</title>

<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>


</head>
<body>
<form name="frm" action ="" method="post">
<input type="hidden" name="bbsId" value="">

	<table width="100%" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="40%"class="title_left">
	  	<h1>
	  		<img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" alt="제목버튼이미지">&nbsp;게시판 정보
	  	</h1>
	  </td>
	  <th >
	  </th>
	  <td width="10%" >
	   		<select name="searchCnd" class="select" title="검색조건선택">
			   <!-- <option selected value=''> --><!--선택하세요--><!-- </option> -->
			   <option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >게시판명</option>
			   <option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >게시판유형</option>
		   </select>
		</td>
	  <td width="35%">
	    <input name="searchWrd" type="text" size="35" value='<c:out value="${searchVO.searchWrd}"/>' maxlength="35" onkeypress="press(event);" title="검색단어입력">
	  </td>
	  <th width="10%">
	   <table border="0" cellspacing="0" cellpadding="0">
	    <tr>
	    <!-- 
	      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif' />" width="8" height="20" alt="button left"></td>
	      <td background="<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>" class="text_left" nowrap>
	      <a href="javascript:fn_egov_select_brdMstr('1')">조회</a>
	      </td>
	      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
	    -->
	      <td><span class="button"><input type="submit" value="조회" title="조회" onclick="javascript:fn_egov_select_brdMstr('1');return false;"></span></td>
	    </tr>
	   </table>
	  </th>
	 </tr>
	</table>
	<table width="100%" cellpadding="8" class="table-line">
	 <thead>
	  <tr>
	    <!-- th class="title" width="3%" nowrap><input type="checkbox" name="all_check" class="check2"></th-->
	    <th class="title" width="10%" nowrap>번호</th>
	    <th class="title" width="36%" nowrap>게시판명</th>
	    <th class="title" width="10%" nowrap>게시판유형</th>
	    <th class="title" width="10%" nowrap>게시판속성</th>
	    <th class="title" width="15%" nowrap>생성일</th>
	    <th class="title" width="8%" nowrap>사용여부</th>
	    <th class="title" width="8%" nowrap>선택</th>
	  </tr>
	 </thead>
	 <tbody>
		 <c:forEach var="result" items="${resultList}" varStatus="status">
		  <tr>
		    <!--td class="lt_text3" nowrap><input type="checkbox" name="check1" class="check2"></td-->
		    <td class="lt_text3" nowrap><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
		    <td class="lt_text3" nowrap>
		    	<c:out value="${result.bbsNm}"/>
		    </td>
		    <td class="lt_text3" nowrap><c:out value="${result.bbsTyCodeNm}"/></td>
		    <td class="lt_text3" nowrap><c:out value="${result.bbsAttrbCodeNm}"/></td>
		    <td class="lt_text3" nowrap><c:out value="${result.frstRegisterPnttm}"/></td>
		    <td class="lt_text3" nowrap>
		    	<c:if test="${result.useAt == 'N'}"><spring:message code="button.notUsed" /></c:if>
		    	<c:if test="${result.useAt == 'Y'}"><spring:message code="button.use" /></c:if>
		    </td>
	    	<td class="lt_text3" nowrap>
		    		<input type="button" value="선택"
		    			onClick="javascript:fn_egov_select_brdMstrInfo('<c:out value="${result.bbsId}"/>','<c:out value="${result.bbsNm}"/>');" />
	    	</td>
		  </tr>
		 </c:forEach>
		 <c:if test="${fn:length(resultList) == 0}">
		  <tr>
		    <td class="lt_text3" nowrap colspan="7" ><spring:message code="common.nodata.msg" /></td>
		  </tr>
		 </c:if>
	 </tbody>
	 <!--tfoot>
	  <tr class="">
	   <td colspan=6 align="center"></td>
	  </tr>
	 </tfoot -->
	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="10"></td>
	  </tr>
	</table>
	<div align="center">
		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_select_brdMstr" />
	</div>
	<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="10"></td>
	  </tr>
	</table>
	<div align="center">
	<table border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
	<!-- 
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" width="8" height="20" alt="버튼이미지"></td>
      <td background="<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>" class="text_left" nowrap>
      <a href="javascript:parent.close()">닫기</a>
      </td>
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
     -->
      <td><span class="button"><input type="button" value="닫기" title="닫기" onclick="javascript:parent.close()"></span></td>
	</tr>
	</table>
	</div>
</form>
</body>
</html>
