import React, { useState } from "react";
import { useGetNameListByUidQuery } from "../redux/apis";

import Form from "./Form";

const NameList = () => {
  const [nameListId, setNameListId] = useState(
    window.location.pathname.substring(1)
  );
  const { data, error, isLoading } = useGetNameListByUidQuery(nameListId);

  return (
    <div>
      <Form nameListId={data?.id} />
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
