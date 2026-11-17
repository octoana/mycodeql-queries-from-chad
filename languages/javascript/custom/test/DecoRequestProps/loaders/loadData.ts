export default async function loader(props: { apiUrl: string }) {
  return await fetch(props.apiUrl);
}
