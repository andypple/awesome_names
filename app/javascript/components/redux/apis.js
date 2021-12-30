import { createApi, fetchBaseQuery } from '@reduxjs/toolkit/query/react'

const API_HOST = 'http://localhost:3005/api/'

export const apis = createApi({
  reducerPath: 'apis',
  baseQuery: fetchBaseQuery({ baseUrl: API_HOST }),
  endpoints: (builder) => ({
    getNameListByUid: builder.query({
      query: (uid) => `name_lists/${uid}`,
    }),
  }),
})

// Export hooks for usage in functional components, which are
// auto-generated based on the defined endpoints
export const { useGetNameListByUidQuery } = apis
