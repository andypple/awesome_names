import React from "react";
import { useGetNameListByUidQuery } from "../redux/apis";

const NameList = () => {
  const { data, error, isLoading } = useGetNameListByUidQuery(window.location.pathname)

   return (
    <div>
       <div>
        {error ? (
          <>Oh no, there was an error</>
        ) : isLoading ? (
          <>Loading...</>
        ) : data ? (
          <>
            <h3>{data.uid}</h3>
            <h3>{data.viewed_at}</h3>
          </>
        ) : null}
      </div>
    </div>
  );
};

export default NameList;
