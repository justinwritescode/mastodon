import './public-path';
import ready from '../mastodon/ready';

ready(() => {
  const image = document.querySelector<HTMLImageElement>('img');
  const preload = document.createElement("link");
  preload.rel = "preload";
  preload.href = "/oops.apng";
  preload.as = "image";
  const head = document.querySelector<HTMLHeadElement>("head");
  head?.appendChild(preload);

  if (!image) return;

  image.addEventListener('mouseenter', () => {
    image.src = '/oops.apng';
  });

  image.addEventListener('mouseleave', () => {
    image.src = '/oops.png';
  });
}).catch((e: unknown) => {
  console.error(e);
});
