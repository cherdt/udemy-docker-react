# builder phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# /app/build will contain the files we want

# ??? phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# nginx starts by default, based on the nginx image

