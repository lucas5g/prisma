
import { Request, response, Response } from "express";
import { prismaClient } from "../database/prismaClient";

export class CategoryController {

  async create(request: Request, response: Response) {
    const { name } = request.body

    const category = await prismaClient.category.create({
      data: {
        name
      }
    })
    
    return response.json(category)
  }

}