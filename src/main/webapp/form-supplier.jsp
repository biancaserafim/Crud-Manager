<jsp:directive.page contentType="text/html; charset=UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!DOCTYPE html>
    <html>

    <head>
        <%@include file="base-head.jsp" %>
            <title>CRUD Manager - Fornecedores</title>
    </head>

    <body>
        <%@include file="nav-menu.jsp" %>

            <div id="container" class="container-fluid">

                <h3 class="page-header">
                    ${not empty supplier ? 'Atualizar' : 'Adicionar'} Fornecedor
                </h3>

                <form action="${pageContext.request.contextPath}/supplier/${action}" method="POST">

                    <input type="hidden" name="supplierId" value="${supplier.getId()}">

                    <div class="row">

                     <div class="form-group col-md-6">
                            <label for="name">Nome</label>
                            <input type="text" class="form-control" id="name" name="name" value="${supplier.getName()}"
                                placeholder="Nome do fornecedor" required>
                        </div>

                        <div class="form-group col-md-6">
                            <label for="email">E-mail</label>
                            <input type="email" class="form-control" id="email" name="email"
                                value="${supplier.getEmail()}" placeholder="E-mail do fornecedor" required>
                        </div>

                    </div>

                    <div class="row">

                        <div class="form-group col-md-6">
                            <label for="phone">Telefone</label>
                            <input type="tel" class="form-control" id="phone" name="phone"
                                value="${supplier.getPhone()}" placeholder="Telefone" required>
                        </div>

                        <div class="form-group col-md-6">
                            <label>Prazo de pagamento</label><br>

                            <label class="radio-inline">
                                <input type="radio" name="paymentTerm" value="A_VISTA"
                                    ${supplier.getPaymentTerm()=='A_VISTA' ? 'checked' : '' } required> À vista
                            </label>

                            <label class="radio-inline">
                                <input type="radio" name="paymentTerm" value="7_DIAS"
                                    ${supplier.getPaymentTerm()=='7_DIAS' ? 'checked' : '' }>
                                7 dias
                            </label>

                            <label class="radio-inline">
                                <input type="radio" name="paymentTerm" value="15_DIAS"
                                    ${supplier.getPaymentTerm()=='15_DIAS' ? 'checked' : '' }>
                                15 dias
                            </label>

                            <label class="radio-inline">
                                <input type="radio" name="paymentTerm" value="30_DIAS"
                                    ${supplier.getPaymentTerm()=='30_DIAS' ? 'checked' : '' }>
                                30 dias
                            </label>
                        </div>

                    </div>

                    <div class="row">

                        <div class="form-group col-md-6">
                            <label for="user">Usuário responsável</label>

                            <select id="user" class="form-control" name="user" required>

                                <option value="">Selecione um usuário</option>

                                <c:forEach var="user" items="${users}">
                                    <option value="${user.getId()}" ${not empty supplier and
                                        supplier.getUser().getId()==user.getId() ? 'selected' : '' }>
                                        ${user.getName()}
                                    </option>
                                </c:forEach>

                            </select>
                        </div>

                    </div>

                    <hr />

                    <div id="actions" class="row pull-right">
                        <div class="col-md-12">

                            <a href="${pageContext.request.contextPath}/suppliers" class="btn btn-default">
                                Cancelar
                            </a>

                            <button type="submit" class="btn btn-primary">
                                ${not empty supplier ? 'Atualizar' : 'Cadastrar'} Fornecedor
                            </button>

                        </div>
                    </div>

                </form>

            </div>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    </body>

    </html>