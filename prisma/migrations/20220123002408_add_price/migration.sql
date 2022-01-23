/*
  Warnings:

  - Added the required column `price` to the `products` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_products" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "bar_code" TEXT NOT NULL,
    "price" DECIMAL NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "new_products" ("bar_code", "created_at", "id", "name") SELECT "bar_code", "created_at", "id", "name" FROM "products";
DROP TABLE "products";
ALTER TABLE "new_products" RENAME TO "products";
CREATE UNIQUE INDEX "products_bar_code_key" ON "products"("bar_code");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
