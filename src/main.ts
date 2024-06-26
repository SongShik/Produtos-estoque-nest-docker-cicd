import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { HttpExeptionFilter } from './shared/filters/http-exeption.filter';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  app.useGlobalFilters(new HttpExeptionFilter());

  await app.listen(Number(process.env.PORT) || 3010);
}
bootstrap();
