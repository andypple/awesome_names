import React, { useState } from "react";
import { useGetNameListByUidQuery } from "../redux/apis";

import Form from "./Form";

const NameList = () => {
  const [nameListId, setNameListId] = useState(
    window.location.pathname.substring(1)
  );
  const { data, error, isLoading } = useGetNameListByUidQuery(nameListId, {
    refetchOnMountOrArgChange: true,
    pollingInterval: 1000,
  });

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
            <h3>Baby list name</h3>
            {data.baby_names.map((babyName) => (
              <div key={babyName.id}> {babyName.name} </div>
            ))}
          </>
        ) : null}
      </div>
    </div>
  );
};

export default NameList;
