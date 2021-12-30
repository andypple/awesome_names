import { configureStore } from "@reduxjs/toolkit";
import { setupListeners } from "@reduxjs/toolkit/query";
import { apis } from "./apis";

export const store = configureStore({
  reducer: {
    [apis.reducerPath]: apis.reducer,
  },
  middleware: (getDefaultMiddleware) =>
    getDefaultMiddleware().concat(apis.middleware),
});

setupListeners(store.dispatch);
