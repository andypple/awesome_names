import React, { useState } from "react";
import { useCreateBabyNameMutation } from "../redux/apis";

const Form = ({ nameListId }) => {
  const [name, setName] = useState("");

  const [createBabyName, createBabyNameResult] = useCreateBabyNameMutation();

  return (
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
            nameListId: nameListId,
          });
          setName("");
        }}
      />
      {createBabyNameResult.isError ? (
        <div>{createBabyNameResult.error.data.error}</div>
      ) : null}
    </div>
  );
};

export default Form;
