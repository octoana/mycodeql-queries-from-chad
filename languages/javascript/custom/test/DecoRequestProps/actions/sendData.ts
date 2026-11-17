export default async function action(props: { apiUrl: string }) {
  return await fetch(props.apiUrl, { method: "POST" });
}
