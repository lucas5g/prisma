import { Request, Response, Router } from "express";
import { CategoryController } from "./controllers/CategoryController";
import { ProductController } from "./controllers/ProductController";

const router = Router()

router.get('/', ( request: Request, response: Response,) => {

  return response.json({
    api: 'Prisma api'
  })

})
router.post('/product', new ProductController().create)
router.post('/category', new CategoryController().create)



export { router }