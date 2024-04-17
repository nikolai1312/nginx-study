<h2>NGINX Study Project</h2>

Repositório feito para entender melhor como utilizar um servidor web. 

#### Ferramentas utilizadas
- [Docker](https://docs.docker.com/manuals/)
- [Cosign](https://docs.sigstore.dev/signing/overview/)
- [Nginx](https://docs.nginx.com/nginx/admin-guide/)
- [Github Actions](https://docs.github.com/en/actions/quickstart)

O servidor escolhido foi o NGINX, que está presente em grande parte da internet hoje em dia. Portanto é uma ferramenta 
essencial para quem deseja trabalhar como DevOps. 

Utilizei uma aplicação que já havia criado anteriormente, um ToDo feito em HTML, CSS e Javascript.
Como é uma aplicação estática e sem dependências decidi utilizá-la por conta da facilidade de montar um ambiente para hostear a aplicação. 

Como imagem base do container utilizei a imagem NGINX da chainguard, uma imagem leve e sem vulnerabilidades, configurando de uma forma específica para rodar na versão mais recente (latest),
a imagem pode ser encontrada [aqui](https://images.chainguard.dev/directory/image/nginx/versions).

A imagem já está registrada no registry do Docker, poderá encontrá-la aqui -> [Image](https://hub.docker.com/repository/docker/nikolai1312/nginx-chainguard/general). 
Além de estar publicada no registry, a imagem está assinada utilizando o Cosign, garantindo que essa imagem não poderá ser adulterada, mantendo a integridade e a segurança da imagem. 

#### To Do
- [ ] Integrar o [trivy](https://github.com/aquasecurity/trivy) na pipeline para checar vulnerabilidades
- [ ] Publicar a aplicação em um serviço de container em uma cloud pública (AWS, GCP, Azure)
- [ ] Configurar a página para receber requisições HTTPS (cert. TLS e configuração no NGINX)
- [ ] Aprender mais!
