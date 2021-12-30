import { createApi, fetchBaseQuery } from '@reduxjs/toolkit/query/react'

const API_HOST = 'https://awesome-names.herokuapp.com/api/'

export const apis = createApi({
  reducerPath: 'apis',
  baseQuery: fetchBaseQuery({ baseUrl: API_HOST }),
  endpoints: (builder) => ({
    getNameListByUid: builder.query({
      query: (uid) => `name_lists/${uid}`,
    }),
    createBabyName: builder.mutation({
      query: ({ name, nameListId }) => ({
        url: `baby_names`,
        method: "POST",
        body: { name: name, name_list_id: nameListId }
      }),
    }),
  }),
})

// Export hooks for usage in functional components, which are
// auto-generated based on the defined endpoints
export const { useGetNameListByUidQuery, useCreateBabyNameMutation } = apis
