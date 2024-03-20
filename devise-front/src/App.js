import axios from "axios";
import Computers from "./components/handleComputers";
import { useEffect, useState } from "react";

const API_URL = "http://localhost:3001/api/v1/computers";
const API_URL_COMPONENT = "http://localhost:3001/api/v1/components"

function getAPIData() {
  return axios.get(API_URL).then((response) => response.data);
}

function App() {
  
  const [computers, setComputer] = useState([]);
  const [components, setComponent] = useState([]);

  useEffect(() => {
    let mounted = true;
    getAPIData().then((items) => {
      if (mounted) {
        setComputer(items);
      }
    });
    return () => (mounted = false);
  }, []);



  return (
    <div>
      <Computers computers={computers} />

<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
  Launch static backdrop modal
</button>

<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">Cadastrar novo computador</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <select class="form-select" aria-label="Default select example">
        <option selected>Selecione um componente</option>
          data
      </select>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary">Construir computador</button>
      </div>
    </div>
  </div>
</div>
    </div>
  );
}

export default App;
