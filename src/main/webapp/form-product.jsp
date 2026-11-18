<jsp:directive.page contentType="text/html; charset=UTF-8" />

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!DOCTYPE html>
    <html>

    <head>
        <%@include file="base-head.jsp" %>
            <title>CRUD Manager - Produtos</title>
    </head>

    <body>
        <%@include file="nav-menu.jsp" %>

            <div id="container" class="container-fluid">
                <h3 class="page-header">
                    ${not empty product ? 'Atualizar' : 'Adicionar'} Produto
                </h3>

                <form action="${pageContext.request.contextPath}/product/${action}" method="POST">

                    <input type="hidden" name="productId" value="${product.getId()}">

                    <div class="row">
                        <div class="form-group col-md-6">
                            <label for="name">Nome</label>
                            <input type="text" class="form-control" id="name" name="name" value="${product.getName()}"
                                placeholder="Nome do produto" required>
                        </div>

                        <div class="form-group col-md-6">
                            <label for="price">Preço</label>
                            <input type="number" step="0.01" min="0" class="form-control" id="price" name="price"
                                value="${product.getPrice()}" placeholder="Preço do produto" required>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-md-6">
                            <label>Unidade</label><br>

                            <label class="radio-inline">
                                <input type="radio" name="unit" value="UNIDADE" ${product.getUnit()=='UNIDADE'
                                    ? 'checked' : '' } required> Unidade
                            </label>

                            <label class="radio-inline">
                                <input type="radio" name="unit" value="QUILO" ${product.getUnit()=='QUILO' ? 'checked'
                                    : '' }>
                                Quilo
                            </label>

                            <label class="radio-inline">
                                <input type="radio" name="unit" value="LITRO" ${product.getUnit()=='LITRO' ? 'checked'
                                    : '' }>
                                Litro
                            </label>
                        </div>

                        <div class="form-group col-md-6">
                            <label for="expirationDate">Data de validade</label>
                            <input type="date" class="form-control" id="expirationDate" name="expirationDate"
                                value="${product.getExpirationDate()}" required>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-md-6">
                            <label for="supplier">Fornecedor</label>
                            <select id="supplier" class="form-control" name="supplier" required>

                                <option value="">Selecione um fornecedor</option>

                                <c:forEach var="supplier" items="${suppliers}">
                                    <option value="${supplier.getId()}" ${not empty product and
                                        product.getSupplier().getId()==supplier.getId() ? 'selected' : '' }>
                                        ${supplier.getName()}
                                    </option>
                                </c:forEach>

                            </select>
                        </div>
                    </div>

                    <hr />

                    <div id="actions" class="row pull-right">
                        <div class="col-md-12">
                            <a href="${pageContext.request.contextPath}/products" class="btn btn-default">
                                Cancelar
                            </a>

                            <button type="submit" class="btn btn-primary">
                                ${not empty product ? 'Atualizar' : 'Cadastrar'} Produto
                            </button>
                        </div>
                    </div>
                </form>
            </div>
            <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
            <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    </body>

    </html>