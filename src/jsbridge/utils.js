export function objsToQuerys(obj = {}) {
  let query = '';
  for (const ele in obj) {
    query = query.concat(`${ele}=${encodeURIComponent(obj[ele])}&`);
  }
  return query !== '' ? query.substring(0, query.lastIndexOf('&')) : '';
}
