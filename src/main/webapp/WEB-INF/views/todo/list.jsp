<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%--<html>--%>
<%--<head>--%>
<%--    <meta charset="utf-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1">--%>
<%--    <title>Bootstrap demo</title>--%>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">--%>
<%--</head>--%>
<%--<body>--%>
<%--<div class="container-fluid">--%>
<%--    <nav class="navbar navbar-expand-lg bg-body-tertiary">--%>
<%--        <div class="container-fluid">--%>
<%--            <div class="row">--%>
<%--                <a class="navbar-brand" href="#">Navbar</a>--%>
<%--                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">--%>
<%--                    <span class="navbar-toggler-icon"></span>--%>
<%--                </button>--%>
<%--                <div class="collapse navbar-collapse" id="navbarNav">--%>
<%--                    <ul class="navbar-nav">--%>
<%--                        <li class="nav-item">--%>
<%--                            <a class="nav-link active" aria-current="page" href="#">Home</a>--%>
<%--                        </li>--%>
<%--                        <li class="nav-item">--%>
<%--                            <a class="nav-link" href="#">Features</a>--%>
<%--                        </li>--%>
<%--                        <li class="nav-item">--%>
<%--                            <a class="nav-link" href="#">Pricing</a>--%>
<%--                        </li>--%>
<%--                        <li class="nav-item">--%>
<%--                            <a class="nav-link disabled" aria-disabled="true">Disabled</a>--%>
<%--                        </li>--%>
<%--                    </ul>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </nav>--%>
<%--</div>--%>
<%@include file="../includes/header.jsp"%>
<div class="row-content">
    <div class="card">
        <div class="card-body">
            <h5 class="card-title">Search</h5>
            <form action="/todo/list" method="get">
<%--                검색어 유지--%>
                <input type="hidden" name="size" value="${pageRequestDTO.size}">
                <div class="mb-3">
                    <input type="checkbox" name="finished" ${pageRequestDTO.finished?"checked":""}>완료여부
                </div>
                <div class="mb-3">
                    <input type="checkbox" name="types" value="t" ${pageRequestDTO.checkType("t")?"checked":""}>제목
                    <input type="checkbox" name="types" value="w" ${pageRequestDTO.checkType("w")?"checked":""}>작성자
                    <input type="text"  name="keyword" class="form-control" value="${pageRequestDTO.keyword}">
                </div>
                <div class="input-group mb-3 dueDateDiv">
                    <input type="date" name="from" class="form-control" value="${pageRequestDTO.from}">
                    <input type="date" name="to" class="form-control" value="${pageRequestDTO.to}">
                </div>
                <div class="input-group mb-3">
                    <div class="float-end">
                        <button class="btn btn-primary" type="submit">Search</button>
                        <button class="btn btn-info clearBtn" type="reset">Clear</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="row footer">
        <div class="row fixed-bottom" style="z-index : -100">
            <footer class="py-1 my-1">
                <p class="text-center text-muted">Footer</p>
            </footer>
        </div>
    </div>
</div>

<div class="row-content">
    <div class="card">
        <div class="card-header">
            Featured
        </div>
        <div class="card-body">
            <h5 class="card-title">Special title treatment</h5>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">Tno</th>
                        <th scope="col">Title</th>
                        <th scope="col">Writer</th>
                        <th scope="col">DueDate</th>
                        <th scope="col">Finished</th>
                    </tr>
                    </thead>
                    <tbody>
<%--                    items의 responseDTO는 TodoController의 이름과 일치--%>
                    <c:forEach items="${responseDTO.dtoList}" var="dto">
                    <tr>
                        <th scope="row">${dto.tno}</th>
                        <td><a href="/todo/read?tno=${dto.tno}&${pageRequestDTO.link}">${dto.title}</a></td>
                        <td>${dto.writer}</td>
                        <td>${dto.dueDate}</td>
                        <td>${dto.finished}</td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
            <nav aria-label="...">
                <ul class="pagination">
<%--                    prev가 True일때만(이전페이지 존재)--%>
                    <c:if test="${responseDTO.prev}">
                        <li class="page-item">
                            <a class="page-link" data-num="${responseDTO.start-1}">Previous</a>
                        </li>
                    </c:if>
<%--                    <li class="page-item"><a class="page-link" href="#">1</a></li>--%>
                    <c:forEach begin="${responseDTO.start}" end="${responseDTO.end}" var="num">
<%--                    <li class="page-item"><a class="page-link" href="#">3</a></li>--%>
                        <li class="page-item ${responseDTO.page==num?"active":""}">
                            <a class="page-link" data-num="${num}">${num}</a>
                        </li>
                    </c:forEach>
                    <c:if test="${responseDTO.next}">
                        <%--                        선택된 부분이 active되는 설정--%>
                        <li class="page-item">
                                <%--                            href 대신 data-num => 스크립트로 처리하기위해--%>
                            <a class="page-link" data-num="${responseDTO.end+1}">Next</a>
                        </li>
                    </c:if>
                </ul>
            </nav>
            <script>
                document.querySelector(".pagination").addEventListener("click", function (e) {
                    e.preventDefault()
                    e.stopPropagation()

                    const target = e.target

                    if (target.tagName !== 'A') {
                        return
                    }
                    const num = target.getAttribute("data-num")

                    self.location = `/todo/list?page=\${num}`
                }, false)
            </script>
        </div>
    </div>

    <%@include file="../includes/footer.jsp"%>
<%--    <div class="row footer">--%>
<%--        <div class="row fixed-bottom" style="z-index : -100">--%>
<%--            <footer class="py-1 my-1">--%>
<%--                <p class="text-center text-muted">Footer</p>--%>
<%--            </footer>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>--%>

<%--</body>--%>
<%--</html>--%>
