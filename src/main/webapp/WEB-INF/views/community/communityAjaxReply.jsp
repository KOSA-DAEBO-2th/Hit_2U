<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<span class="content_tab">댓글 (${fn:length(reply_list)}) </span>
<div class="question_section padding_top_20 padding_bottom_20">
	<div class="reply_section font_14">
		<textarea cols="20" wrap="hard" class="reply_input"
			placeholder="댓글을 입력해주세요."></textarea>
		<div class="flex reply_add">
			<div>
				<text class="reply_current_value"></text>
				/
				<text class="font_gray">1,000</text>
			</div>
			<div>
				<button class="btn reply_submit">등록</button>
			</div>
		</div>
	</div>
</div>
<div class="reply_ajax">
	<c:choose>
		<c:when test="${reply_list == null or fn:length(reply_list) == 0}">
			<div
				class="reply_answer_section flex no_reply item_center font_14 content_center">등록된
				댓글이 없습니다.</div>
		</c:when>

		<c:otherwise>
			<c:forEach items="${reply_list }" var="reply_list" varStatus="i">
				<div class="question_section padding_top_20 padding_bottom_20">

					<div class="reply_answer_section">
						<div class="flex item_center">
							<div class="img_form margin_right_20">
								<a href="#"><img class="reply_profile" title="profile"
									src="${pageContext.request.contextPath}/resources/images/maple.jpg" /></a>
							</div>
							<div class="userid">${reply_list.nickname}</div>
							<div class="flex content_end reply_date font_12">
								<fmt:formatDate value="${reply_list.reply_date }"
									pattern="yy.MM.dd HH:mm" />
							</div>
						</div>
						<div class="padding_top_20 font_14 reply_output">
							${reply_list.r_content }</div>
					</div>

				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</div>