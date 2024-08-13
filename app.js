const express = require('express')
const mysql = require('mysql2/promise')
const app = express()
const PORT = 3000
app.use(express.json())
app.use(express.urlencoded({ extended: true }))
const cors = require('cors');

app.use(cors)





const conn = mysql.createPool({
    host: 'localhost',
    database: 'agro',
    user: 'root',
    password: ''
})


app.get('/plantios', async (req, res) => {

    const [results, fields] = await conn.query('select  *  from plantio')
    res.json(results)
})


app.post('/registrarPlantio', async (req, res) => {
    const {
        variedade,
        data_plantio,
        qtde_plantada,
        localizacao
    } = req.body;
    const [results, fields] = await conn.execute('insert into plantio (Variedade , Data_Plantio, Quantidade_Plantada, Localizacao) values (?,?,?,?)  ',
        [
            variedade,
            data_plantio,
            qtde_plantada,
            localizacao
        ])

    res.json({
        novo_codigo: results.insertId
    })
})


app.get('/mudas', async (req, res) => {

    const [results, fields] = await conn.query(' SELECT SUM(Quantidade_Plantada) as QTD from plantio ')
    console.log(results)
    res.json({

        total_mudas: results[0].QTD,
        data_atualizacao: new Date().toLocaleDateString()
    })

})


app.listen(PORT, () => console.log('servidor online'))