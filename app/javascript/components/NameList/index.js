import React, { useState } from "react";
import {
  useGetNameListByUidQuery,
  useCreateBabyNameMutation,
} from "../redux/apis";

const NameList = () => {
  const [nameListId, setNameListId] = useState(
    window.location.pathname.substring(1)
  );
  const [name, setName] = useState("");

  const { data, error, isLoading } = useGetNameListByUidQuery(nameListId);
  const [createBabyName, createBabyNameResult] = useCreateBabyNameMutation();

  return (
    <div>
      <div>
        <input
          type="text"
          value={name}
          onChange={(e) => setName(e.target.value)}
        />
        <input
          type="button"
          value="Add new name"
          onClick={() => {
            createBabyName({
              name: name,
              nameListId: data.id,
            });
            setName("")
          }}
        />
        {createBabyNameResult.isError ? (
          <div>{createBabyNameResult.error.data.error}</div>
        ) : (
          null
        )}
      </div>
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
