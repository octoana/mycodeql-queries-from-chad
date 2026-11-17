export default async function notADecoBlock(props: { apiUrl: string }) {
  return await fetch(props.apiUrl);
}
