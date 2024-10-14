<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../includes/header.jsp"%>
<div class="row-content">
  <div class="card">
    <div class="card-header">
      Todo 상세보기
    </div>
    <div class="card-body">
      <h5 class="card-title">Todo 상세보기 페이지</h5>
      <div class="input-group mb-3">
        <label class="input-group-text">Tno</label>
        <input class="form-control" type="text" name="tno" value="${dto.tno}" readonly>
      </div>
      <div class="input-group mb-3">
        <label class="input-group-text">Title</label>
        <input class="form-control" type="text" name="title" value="${dto.title}" readonly>
      </div>
      <div class="input-group mb-3">
        <label class="input-group-text">DueDate</label>
        <input class="form-control" type="date" name="duedate" value="${dto.dueDate}" readonly>
      </div>
      <div class="input-group mb-3">
        <label class="input-group-text">Writer</label>
        <input class="form-control" type="text" name="writer" value="${dto.writer}" readonly>
      </div>
      <div class="form-check">
        <label class="form-check-label">Finished</label>
        <input class="form-check-input" type="checkbox" ${dto.finished?"checked":""} disabled>
      </div>
    </div>
    <div class="my-4">
        <div class="float-end">
          <button type="button" class="btn btn-primary"> Modify </button>
          <button type="button" class="btn btn-secondary"> List </button>
        </div>
      </div>
  </div>
  <script>
    document.querySelector(".btn-primary").addEventListener("click", function (e) {
      self.location="/todo/modify?tno="+${dto.tno}
    }, false)
    document.querySelector(".btn-secondary").addEventListener("click", function (e) {
      self.location="/todo/list"
    }, false)
  </script>
  <div class="row footer">
    <div class="row fixed-bottom" style="z-index : -100">
      <footer class="py-1 my-1">
        <p class="text-center text-muted">Footer</p>
      </footer>
    </div>
  </div>
</div>
<%@ include file="../includes/footer.jsp"%>