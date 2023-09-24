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
	<div class="reply_update_load_form">
		<div class="reply_section font_14">
			<sec:authorize access="isAnonymous()">
				<textarea cols="20" wrap="hard" class="reply_input"
					placeholder="로그인한 사용자만 댓글 입력이 가능합니다." readonly></textarea>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<textarea cols="20" wrap="hard" class="reply_input"
					placeholder="댓글을 입력해주세요."></textarea>
			</sec:authorize>


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
						<input class="reply_no" type="hidden"
							value="${reply_list.reply_no }">

						<div class="userid_form flex">
							<div class="img_form margin_right_20">
								<a href="#"><img class="reply_profile" title="profile"
									src="${reply_list.profile}" /></a>
							</div>
							<div class="flex direction_column">
								<div class="flex item_center">

									<div class="userid">${reply_list.nickname}</div>
								</div>
								<div class="icon_area font_12">
									<i class="fa-solid fa-flask"></i> 300
								</div>


							</div>
							<div class="flex content_end reply_date font_12"">
								<div class="flex" style="flex-direction: column;">
									<div>
										<fmt:formatDate value="${reply_list.reply_date }"
											pattern="yy.MM.dd HH:mm" />
									</div>
									<div class="flex"
										style="justify-content: flex-end; color: #212529; font-weight: 500;">

										<sec:authorize access="isAuthenticated()">
											<c:set var="reply_id">
												<sec:authentication property="principal.nickname" />
											</c:set>
											<c:if test="${reply_list.nickname eq '주영회(33세)'}">
												<div class="reply_cursor reply_update">수정</div>
												<div style="margin: 0px 8px;">/</div>
												<div class="reply_cursor reply_delete">삭제</div>
											</c:if>

										</sec:authorize>





									</div>
								</div>

							</div>

						</div>
						<div class="reply_update_form">
							<div class="padding_top_20 font_14">
								<%-- <textarea cols="20"  class="reply_output" readonly>${reply_list.r_content }</textarea> --%>
								<span class="reply_output">${reply_list.r_content }</span>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</div>

<%-- <span class="content_tab">댓글 (${fn:length(reply_list)}) </span>
<div class="question_section padding_top_20 padding_bottom_20">
	<div class="reply_update_load_form">
		<div class="reply_section font_14">
			<sec:authorize access="isAnonymous()">
				<textarea cols="20" wrap="hard" class="reply_input"
					placeholder="로그인한 사용자만 댓글 입력이 가능합니다." readonly></textarea>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<textarea cols="20" wrap="hard" class="reply_input"
					placeholder="댓글을 입력해주세요."></textarea>
			</sec:authorize>


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
						<input class="reply_no" type="hidden"
							value="${reply_list.reply_no }">

						<div class="userid_form flex">
							<div class="img_form margin_right_20">
								<a href="#"><img class="reply_profile" title="profile"
									src="${pageContext.request.contextPath}/resources/images/maple.jpg" /></a>
							</div>
							<div class="flex direction_column">
								<div class="flex item_center">
									<div class="userid">${reply_list.nickname}</div>
								</div>
								<div class="icon_area font_12">
									<i class="fa-solid fa-flask"></i> 300
								</div>


							</div>
							<div class="flex content_end reply_date font_12"">
								<div class="flex" style="flex-direction: column;">
									<div>
										<fmt:formatDate value="${reply_list.reply_date }"
											pattern="yy.MM.dd HH:mm" />
									</div>
									<div class="flex"
										style="justify-content: flex-end; color: #212529; font-weight: 500;">
										<div class="reply_cursor reply_update">수정</div>
										<div style="margin: 0px 8px;">/</div>
										<div class="reply_cursor reply_delete">삭제</div>
									</div>
								</div>

							</div>

						</div>
						<div class="reply_update_form">
							<div class="padding_top_20 font_14">
								<textarea cols="20"  class="reply_output" readonly>${reply_list.r_content }</textarea>
								<span class="reply_output">${reply_list.r_content }</span>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</div> --%>
