<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../includes/header.jsp"%>
<div class="row-content">
  <div class="card">
    <div class="card-header">
      Todo Register Page
    </div>
    <div class="card-body">
      <h5 class="card-title">Todo Register</h5>
      <form action="/todo/register" method="post">
        <div class="input-group mb-3">
          <label class="input-group-text">Title</label>
          <input class="form-control" type="text" name="title" placeholder="Title">
        </div>
        <div class="input-group mb-3">
          <label class="input-group-text">DueDate</label>
          <input class="form-control" type="date" name="dueDate" placeholder="DueDate">
        </div>
        <div class="input-group mb-3">
          <label class="input-group-text">Writer</label>
          <input class="form-control" type="text" name="Writer" placeholder="Writer">
        </div>
        <div class="my-4">
          <div class="float-end">
            <button type="submit" class="btn btn-primary">Submit</button>
            <button type="reset" class="btn btn-secondary">reset</button>
          </div>
        </div>
      </form>
      <script>
        console.log(`${errors}`)
        <%--out.println(`${error}`)--%>
      </script>
<%--      ${errors}--%>
<%--      <script>--%>
<%--        const serverValidResult = {}--%>
<%--        // errors : TodoController에서 전달받은 이름--%>
<%--        <c:forEach items="${errors}" var="error">--%>
<%--        serverValidResult["${error.getField()}"] = "${error.defaultMessage}"--%>
<%--        </c:forEach>--%>
<%--        console.log(serverValidResult)--%>
<%--        // out.println(serverValidResult)--%>
<%--      </script>--%>
    </div>
  </div>
<%@include file="../includes/footer.jsp"%>