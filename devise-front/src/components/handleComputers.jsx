import React from "react";

function  Computers(props) {
    return(
        <div>
            {props.computers.map((computer) => {
                return <div key={computer.id}>
                    <h2>{computer.clientName}</h2>
                    <p>{computer.component_names.join(", ")}</p>
                    <button className="btn btn-primary">Exibir detalhes do cliente</button>
                    </div>
            })}
        </div>
    )
}

export default Computers