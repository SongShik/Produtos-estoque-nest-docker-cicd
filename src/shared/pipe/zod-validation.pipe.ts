import { ArgumentMetadata, BadRequestException, PipeTransform } from "@nestjs/common";
import { ZodSchema } from "zod";

export class ZodValidation implements PipeTransform{
    constructor(private schema: ZodSchema) {}

    transform(value: any) {
        try{
            const parsedValue = this.schema.parse(value);
            return parsedValue;
        } catch (error) {
            throw new BadRequestException("validação errada");
        }
    }
}