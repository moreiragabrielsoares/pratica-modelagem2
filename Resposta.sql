CREATE TABLE "public.customers" (
	"id" serial NOT NULL,
	"fullName" TEXT NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL,
	CONSTRAINT "customers_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.products" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"price" integer NOT NULL,
	"mainPhoto" TEXT NOT NULL,
	"categoryId" TEXT NOT NULL,
	"size" TEXT NOT NULL,
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.productsPhotos" (
	"id" serial NOT NULL,
	"productId" serial NOT NULL,
	"photo" TEXT NOT NULL,
	CONSTRAINT "productsPhotos_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.categories" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	CONSTRAINT "categories_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.addresses" (
	"id" serial NOT NULL,
	"address" TEXT NOT NULL UNIQUE,
	CONSTRAINT "addresses_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.purchases" (
	"id" serial NOT NULL,
	"productId" serial NOT NULL,
	"customerId" integer NOT NULL,
	"quantity" integer NOT NULL,
	"orderCode" character varying(8) NOT NULL,
	"orderStatus" TEXT NOT NULL,
	"orderDate" TIMESTAMP NOT NULL,
	"deliveryAddress" integer NOT NULL,
	CONSTRAINT "purchases_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.customerAddresses" (
	"id" serial NOT NULL,
	"customerId" integer NOT NULL,
	"addressId" integer NOT NULL,
	CONSTRAINT "customerAddresses_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "products" ADD CONSTRAINT "products_fk0" FOREIGN KEY ("categoryId") REFERENCES "categories"("id");

ALTER TABLE "productsPhotos" ADD CONSTRAINT "productsPhotos_fk0" FOREIGN KEY ("productId") REFERENCES "products"("id");



ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk0" FOREIGN KEY ("productId") REFERENCES "products"("id");
ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk1" FOREIGN KEY ("customerId") REFERENCES "customers"("id");
ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk2" FOREIGN KEY ("deliveryAddress") REFERENCES "addresses"("id");

ALTER TABLE "customerAddresses" ADD CONSTRAINT "customerAddresses_fk0" FOREIGN KEY ("customerId") REFERENCES "customers"("id");
ALTER TABLE "customerAddresses" ADD CONSTRAINT "customerAddresses_fk1" FOREIGN KEY ("addressId") REFERENCES "addresses"("id");