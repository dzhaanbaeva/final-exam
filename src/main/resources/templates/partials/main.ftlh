<#macro renderWith title="crm" scripts=["/js/script.js"] styles=["/css/main.css"]>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8"/>
        <meta name="viewport"
              content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
        <meta http-equiv="X-UA-Compatible" content="ie=edge"/>

        <title>${title}</title>
        <link rel="stylesheet" href="/css/main.css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
              crossorigin="anonymous"/>
        <#list styles as styleSource>
            <link rel="stylesheet" href="${styleSource}"/>
        </#list>
    </head>
    <body>
    <nav class="navbar  navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="/">Главная</a>

            <div class="collapse navbar-collapse justify-content-end">
                <ul class="nav">
                    <li class="nav-item mr-2 form-inline">
                        <input type="search" id="search-input" class="form-control " placeholder="Поиск"/>
                        <button class="btn btn-outline-light ml-1" id="btn-search" onclick="search()">Поиск</button>
                    </li>
                    <#if user??>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown"
                                   aria-haspopup="true" aria-expanded="false">Hello, User</a>
                                <div class="dropdown-menu">
                                    <form class="flex box-128" action="/logout" method="post">
                                        <#if _csrf??>
                                            <input type="hidden" name="${(_csrf.parameterName)!'csrf'}"
                                                   value="${(_csrf.token)!'--no-token--'}"/>
                                        </#if>
                                        <button class="btn btn-outline-light ">Logout</button>
                                    </form>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link " href="/addPlace" role="button" aria-haspopup="true"
                                   aria-expanded="false">Add new place</a>
                            </li>

                      <#else>
                        <li class="nav-item">
                            <form class="flex box-128" action="/login" method="get">
                                <#if _csrf??>
                                    <input type="hidden" name="${(_csrf.parameterName)!'csrf'}"
                                           value="${(_csrf.token)!'--no-token--'}"/>
                                </#if>
                                <button class="btn btn-outline-light ">Log in</button>
                            </form>
                        </li>
                    <li class="nav-item">
                        <form class="flex box-128" action="/register" method="get">
                            <#if _csrf??>
                                <input type="hidden" name="${(_csrf.parameterName)!'csrf'}"
                                       value="${(_csrf.token)!'--no-token--'}"/>
                            </#if>
                            <button class="btn btn-outline-light ">Sign up</button>
                        </form>
                    </li>
                    </#if>
                </ul>
            </div>
        </div>
    </nav>

<#--    <nav class="navbar navbar-expand-md navbar-light bg-light mb-3">-->
<#--        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"-->
<#--                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span-->
<#--                    class="navbar-toggler-icon"></span></button>-->
<#--        <div class="collapse navbar-collapse justify-content-around" id="navbarSupportedContent">-->
<#--        </div>-->

<#--    </nav>-->

    <div class="container">
        <#nested>
    </div>

    <#list scripts as scriptSource>
        <script src="${scriptSource}"></script>
    </#list>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
            integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>
    </body>
    </html>

</#macro>