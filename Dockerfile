FROM alpine:3.15
# Create app directory
WORKDIR /Studentdesk
ENV PATH="./node_modules/.bin:$PATH" 
COPY . . 
RUN npm run build
EXPOSE 3000
CMD [“npm”, “start”]