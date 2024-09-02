import './public-path';
import ready from '../mastodon/ready';

ready(() => {
  const static_image = document.querySelector<HTMLImageElement>('img.error-img-static');
  const dynamic_image = document.querySelector<HTMLImageElement>('img.error-img-dynamic');

  if (!static_image) return;
  if (!dynamic_image) return;
 
  static_image.addEventListener('mouseenter', () => {
    dynamic_image.style.display = "block";
    static_image.style.display = "none";
  });

  dynamic_image.addEventListener('mouseleave', () => {
    dynamic_image.style.display = "none";
    static_image.style.display = "block";
  });
}).catch((e: unknown) => {
  console.error(e);
});
