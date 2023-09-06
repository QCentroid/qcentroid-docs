FROM squidfunk/mkdocs-material AS build
COPY . /docs/
RUN mkdocs build


FROM nginx:stable-alpine
COPY --from=build /docs/site /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
