using UnityEngine;
using System.Collections;

public class UVSprite02 : MonoBehaviour
{
    private float timeValue;
    public int Times = 9;
    public int Speed = 1;

    // Use this for initialization
    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {

    }

    void FixedUpdate()
    {
        timeValue = Mathf.Ceil(Time.time * Speed % Times);
        transform.renderer.material.SetFloat("_TimeValue", timeValue);
    }
}
