docker network create knote

docker build -t knote .

docker run \
  --name=mongo \
  --rm \
  --network=knote \
  mongo
  
docker run \
  --name=minio \
  --rm \
  --network=knote \
  -p 9000:9000 \
  -e MINIO_ACCESS_KEY=mykey \
  -e MINIO_SECRET_KEY=mysecret \
  minio/minio server /data
  
docker run \
  --name=knote \
  --rm \
  --network=knote \
  -p 3000:3000 \
  -e MONGO_URL=mongodb://mongo:27017/dev \
  -e MINIO_HOST=minio \
  -e MINIO_ACCESS_KEY=mykey \
  -e MINIO_SECRET_KEY=mysecret \
  knote
  
docker tag knote <username>/knote-js:1.0.0

docker push <username>/knote-js:1.0.0
